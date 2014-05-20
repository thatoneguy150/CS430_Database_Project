with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure Dayan_Prog_2 is
------------------------------------------------------------------------
--| This program records important information about people in an array,
--| and then prints the array.
--| Written by: Josh Dayan
------------------------------------------------------------------------

   subtype Name_Type is String (1 .. 30);
   subtype ID_Type is Natural range 0 .. 99999;
   subtype Phone_Type is Natural range 0 .. 9999;
   
   type Person_Record is record
      First_Name : Name_Type := (others => ' ');
      Middle_IN : Name_Type := (others => ' ');
      Last_Name : Name_Type := (others => ' ');
      Phone_Number : Phone_Type;
      ID_Number : ID_Type;
   end record;

   subtype Person_Index_Range is Integer range 1 .. 100;

   type Person_Array_Type is array (Integer range <>) of Person_Record;

   procedure Get_Person (Item : out Person_Record) is
      
      Last_Char : Integer;
      Middle_Char : Integer;
      First_Char : Integer;
      
   begin -- Get_Person
      Put (Item => "Enter the person's ID: ");
      Get (Item => Item.ID_Number);
      Skip_Line;
      if Item.ID_Number /= 0 then
         Put (Item => "Enter the person's first name: ");
         Get_Line (Item => Item.First_Name, Last => First_Char);
         Put (Item => "Enter the person's middle initial: ");
         Get_Line (Item => Item.Middle_IN, Last => Middle_Char);
         Put (Item => "Enter the person's last name: ");
         Get_Line (Item => Item.Last_Name, Last => Last_Char);
         Put (Item => "Enter the person's phone number: ");
         Get (Item => Item.Phone_Number);
      end if;
      New_Line;
      Skip_Line;  
   end Get_Person;
   
   procedure Put_Person (Item : in Person_Record) is
   begin -- Put_Person
      Put (Item => Item.Last_Name (1 .. 30));
      Put (Item => Item.First_Name (1 .. 20));
      Put (Item => Item.Middle_IN (1 .. 4));
      Put (Item => Item.ID_Number, Width => 1);
      Put (Item => Item.Phone_Number, Width => 5);
      New_Line;
   end Put_Person;
   
   procedure Swap (A : in out Person_Record; B : in out Person_Record) is
      Temp : Person_Record;
   begin --Swap
      Temp := A; 
      A := B;
      B := Temp;
   end Swap;

   procedure Sort_Person_List (Person_List : in out Person_Array_Type;
                               Current_Index : in Person_Index_Range) is
      Index_Of_Min : Person_Index_Range;
   begin -- Sort_Person_List
      for PositionToFill in Person_List'First .. Current_Index loop
         Index_Of_Min := PositionToFill;
         for Item_To_Compare in PositionToFill + 1 .. Current_Index loop
            if Person_List (Item_To_Compare).Last_Name < Person_List (Index_Of_Min).Last_Name then
               Index_Of_Min := Item_To_Compare;
            elsif Person_List (Item_To_Compare).Last_Name = Person_List (Index_Of_Min).Last_Name then
                  if Person_List (Item_To_Compare).First_Name < Person_List (Index_Of_Min).First_Name then
                     Index_Of_Min := Item_To_Compare;
                  end if;
            end if;
         end loop;
         if Index_Of_Min /= PositionToFill then
            Swap (A => Person_List (Index_Of_Min), B => Person_List (PositionToFill));
         end if;
      end loop;
   end Sort_Person_List;

   Person_List : Person_Array_Type (Person_Index_Range);

   Current_Index : Person_Index_Range := 1;  
   Counter : Natural := 0;
   
   Current_Person : Person_Record;
   Check_Person : Person_Record;
   
begin --Dayan_Prog_2
   Put (Item => "Welcome to the phone directory! Please begin each name with a capital letter. (An ID of 0 will quit)");
   New_Line;
   loop
      Counter := 0;
      Get_Person (Item => Current_Person);
      exit when Current_Person.ID_Number = 0;
      for index in 1 .. Current_Index loop
         Check_Person := Person_List (index);
         if Current_Person.ID_Number = Check_Person.ID_Number then
            Person_List (Index) := Current_Person;
            Counter := Counter + 1;
         end if;
      end loop;
      if Counter = 0 then
         Person_List (Current_Index) := Current_Person;
      else
         Current_Index := Current_Index - 1;
      end if;
      Current_Index := Current_Index + 1;
   end loop;
   
   Sort_Person_List (Person_List, Current_Index - 1);
   
   Put_Line (Item => "Last Name                  First Name             MI  ID  Phone Ext.");
   Put_Line (Item => "--------------------------------------------------------------------");
   for index in Person_List'First .. Current_Index - 1 loop
      Put_Person (Item => Person_List (Index));
   end loop;
end Dayan_Prog_2;