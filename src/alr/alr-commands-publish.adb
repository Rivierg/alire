with Alire.Publish;
with Alire.URI;

package body Alr.Commands.Publish is

   package URI renames Alire.URI;

   -------------
   -- Execute --
   -------------

   overriding
   procedure Execute (Cmd : in out Command) is

      function Commit return String
      is (if Num_Arguments >= 2 then Argument (2) else "");

   begin
      if Cmd.Prepare then
         if Num_Arguments < 1 then
            Alire.Publish.Local_Repository;

         elsif Num_Arguments > 2 then
            Reportaise_Wrong_Arguments
              ("Unknown extra arguments, only a mandatory URL"
               & " and optional revision are expected");

         else

            --  Choose between local path or remote

            declare
               URL : constant String := Argument (1);
            begin
               if URI.Scheme (URL) in URI.File_Schemes then
                  Alire.Publish.Local_Repository (Path   => URL,
                                                  Commit => Commit);
               else
                  Alire.Publish.Verify_And_Create_Index_Manifest
                    (Origin => URL,
                     Commit => Commit);
               end if;
            end;

         end if;

      else
         Trace.Warning
           ("No publishing subcommand given, defaulting to "
            & Switch_Prepare & " ...");
         Cmd.Prepare := True;
         Execute (Cmd);
      end if;
   end Execute;

   --------------------
   -- Setup_Switches --
   --------------------

   overriding
   procedure Setup_Switches
     (Cmd    : in out Command;
      Config : in out GNAT.Command_Line.Command_Line_Configuration)
   is
      use GNAT.Command_Line;
   begin
      Define_Switch
        (Config,
         Cmd.Prepare'Access,
         "", Switch_Prepare,
         "Start the publishing assistant using a ready remote origin");
   end Setup_Switches;

end Alr.Commands.Publish;
