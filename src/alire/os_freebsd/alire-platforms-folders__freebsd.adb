with Alire.Platforms.Common;

package body Alire.Platforms.Folders is

   --  Linux implementation

   -----------
   -- Cache --
   -----------

   function Cache return Absolute_Path is (Common.XDG_Cache_Folder);

   -----------
   -- Config--
   -----------

   function Config return Absolute_Path is (Common.XDG_Config_Folder);

   ----------
   -- Home --
   ----------

   function Home return Absolute_Path is (Common.Unix_Home_Folder);

end Alire.Platforms.Folders;
