using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page {
    

    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void ASPxCallback1_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        string RootFolder = Server.MapPath(@"~\");
        bool overwrite = e.Parameter == "1";
        string path = Path.Combine(fm.SelectedFolder.RelativeName, tbFileName.Text);
        path = Path.Combine(RootFolder, path);
        if (File.Exists(path) && !overwrite)
            e.Result = "OVER";
        else {
            try {
                // File.WriteAllText(path, ASPxMemo1.Text); Uncomment this line to save the file
                throw new Exception("Cannot save the file online ");
                e.Result = "OK";
            }
            catch (Exception exc) {
                e.Result = exc.Message;
            }
        }
    }
}