using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Sitefinity.Data.Linq;
using Telerik.Sitefinity.Modules.News;
using Telerik.Sitefinity.Multisite;
using Telerik.Sitefinity.News.Model;

namespace SitefinityWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MultisiteManager manager = MultisiteManager.GetManager();
            var site = manager.GetSites().Where(s => s.Name == "Subsite").FirstOrDefault();
            var dataSourceLinks = site.SiteDataSourceLinks;

            var providers = NewsManager.ProvidersCollection.ToList();

            var items = SitefinityQuery
                .Get<NewsItem>(NewsManager.ProvidersCollection.First());

            var first = items.FirstOrDefault();

        }
    }
}