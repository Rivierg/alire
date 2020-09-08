with Alire.Origins;
with Alire.URI;

package Alire.Publish is

   procedure Local_Repository (Path   : Any_Path := ".";
                               Commit : String   := "") with
     Pre => URI.Scheme (Path) in URI.File_Schemes;
   --  Check that given Path is an up-to-date git repo with origin in the
   --  whitelist. If so, proceed with remote repo verification. If no commit
   --  given use the HEAD commit.

   procedure Verify_And_Create_Index_Manifest (Origin : URL;
                                               Commit : String := "");
   --  Requires a remote URL to a source file or a git repository. Commit is
   --  mandatory in the latter case. Produces a file `crate-version.toml` in
   --  the current directory or raises Checked_Error with the appropriate error
   --  message set.

end Alire.Publish;
