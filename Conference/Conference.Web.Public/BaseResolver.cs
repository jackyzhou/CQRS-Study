using Microsoft.Practices.Unity;
using System;
using System.Collections.Generic;

namespace Conference.Web.Public
{
    public class BaseResolver : IDisposable
    {
        protected IUnityContainer container;

        public BaseResolver(IUnityContainer container)
        {
            if (container == null)
            {
                throw new ArgumentNullException();
            }
            this.container = container;
        }

        public object GetService(Type serviceType)
        {
            try
            {
                return container.Resolve(serviceType);
            }
            catch (ResolutionFailedException)
            {
                return null;
            }
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            try
            {
                return container.ResolveAll(serviceType);
            }
            catch (ResolutionFailedException)
            {
                return new List<object>();
            }
        }

        public void Dispose()
        {
            container.Dispose();
        }
    }
}
