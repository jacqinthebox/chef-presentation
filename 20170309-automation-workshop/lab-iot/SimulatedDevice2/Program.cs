using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;

namespace SimulatedDevice2
{
    class Program
    {

        static DeviceClient deviceClient;
        static string iotHubUri = "lab-iot-hub.azure-devices.net";
        static string deviceKey = "4r8l3GFOJ9W4m/Om5NFfS/IiYBQqY/64TVJOz518PBU=";

        public static String GetTimestamp(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssfff");
        }

        private static async void SendDeviceToCloudMessagesAsync()
        {
            Random rand = new Random();

            while (true)
            {
                int currentSystolicBloodpressure = rand.Next(40, 220);
                int currentDiastolicBloodpressure = rand.Next(40, 220);
                int currentPatientId = rand.Next(1, 10);
                string currentTime = GetTimestamp(DateTime.Now);

                var telemetryDataPoint = new
                {
                    deviceId = "Device02",
                    systolicBloodpressure = currentSystolicBloodpressure,
                    diastolicBloodpressure = currentDiastolicBloodpressure,
                    patientId = currentPatientId,
                    time = currentTime,
                    guid = Guid.NewGuid()
                };
                var messageString = JsonConvert.SerializeObject(telemetryDataPoint);
                var message = new Message(Encoding.ASCII.GetBytes(messageString));

                await deviceClient.SendEventAsync(message);
                Console.WriteLine("{0} > Sending message: {1}", DateTime.Now, messageString);

                Task.Delay(10000).Wait();
            }
        }


        static void Main(string[] args)
        {
            Console.WriteLine("Simulated device no 1\n");
            deviceClient = DeviceClient.Create(iotHubUri, new DeviceAuthenticationWithRegistrySymmetricKey("Device02", deviceKey), TransportType.Mqtt);

            SendDeviceToCloudMessagesAsync();
            Console.ReadLine();
        }
    }
}

