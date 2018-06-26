using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MapleLeaf2.Startup))]
namespace MapleLeaf2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
