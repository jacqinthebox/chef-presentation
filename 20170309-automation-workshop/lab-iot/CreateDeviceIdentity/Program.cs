using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Devices;
using Microsoft.Azure.Devices.Common.Exceptions;


namespace CreateDeviceIdentity
{
    class Program
    {
        private static RegistryManager registryManager;
        //private static string connectionString = "HostName=lab-iot-hub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=ndnut70/M5QkdgTbOVAz5XLgtnMr/oTS10lbrhND4Ho=";
        private static string connectionString = "HostName=demo1-iot-iothub.azure-devices.net;SharedAccessKeyName=iothubowner;SharedAccessKey=i9rJ/PvF38uuDXATCExvASiz8bpSTXQOdpgXA/5/SE0=";

        private static async Task AddDeviceAsync()
        {
            string deviceId = "DemoDevice02";
            Device device;
            try
            {
                device = await registryManager.AddDeviceAsync(new Device(deviceId));
            }
            catch (DeviceAlreadyExistsException)
            {
                device = await registryManager.GetDeviceAsync(deviceId);
            }
            Console.WriteLine("Generated device key: {0}", device.Authentication.SymmetricKey.PrimaryKey);
        }

        static void Main(string[] args)
        {


            registryManager = RegistryManager.CreateFromConnectionString(connectionString);
            AddDeviceAsync().Wait();
            Console.ReadLine();


        }
    }
}
