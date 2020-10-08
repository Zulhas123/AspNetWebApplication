using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Seven_module_project.Startup))]
namespace Seven_module_project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
