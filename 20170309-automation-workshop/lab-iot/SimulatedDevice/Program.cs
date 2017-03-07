using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.Devices.Client;
using Newtonsoft.Json;

namespace SimulatedDevice
{
    class Program
    {
        static DeviceClient deviceClient;
        static string iotHubUri = "lab-iot-hub.azure-devices.net";
        static string deviceKey = "NOmJPqliDcaAiyqQdHJxN+RxLLSdLd/iIp+MSaa+h/8=";

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
                    deviceId = "Device01",
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
            deviceClient = DeviceClient.Create(iotHubUri, new DeviceAuthenticationWithRegistrySymmetricKey("Device01", deviceKey), TransportType.Mqtt);

            SendDeviceToCloudMessagesAsync();
            Console.ReadLine();
        }
    }
}
