import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/api/weather_app/weather_provider.dart';
import '../../../../Modals/api/weather_app/weather_modal.dart';

class weather_app_homepage extends StatefulWidget {
  const weather_app_homepage({super.key});

  @override
  State<weather_app_homepage> createState() => _weather_app_homepageState();
}

class _weather_app_homepageState extends State<weather_app_homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
    // fetchWeather();
  }

  WeatherModal? weatherModal;

  fetchdata() {
    Provider.of<weather_Provider>(context, listen: false).fetchweather(
      Provider.of<weather_Provider>(context, listen: false).country,
      Provider.of<weather_Provider>(context, listen: false).days,
    );
  }

  TextEditingController whetherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<weather_Provider>(context, listen: false)
              .fetchweather(
            Provider.of<weather_Provider>(context, listen: false).country,
            Provider.of<weather_Provider>(context, listen: false).days,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              WeatherModal? weatherModal = snapshot.data;
              Location? location = weatherModal?.location;
              Current? current = weatherModal?.current;
              Forecastday? forecastday = weatherModal?.forecast.forecastday[0];

              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent.shade100,
                      const Color(0xFF71b6f2),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) =>
                                            AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text("Enter City Name"),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Enter City Name",
                                                  ),
                                                  controller: whetherController,
                                                  onSubmitted: (value) {
                                                    Provider.of<weather_Provider>(
                                                            context,
                                                            listen: false)
                                                        .chooseCountry(value);
                                                    whetherController.clear();
                                                    Navigator.of(context).pop();
                                                  }),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Time : ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Text(
                                    "${location?.localtime}".split(" ")[1],
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Date : ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Text(
                                    "${location?.localtime}".split(" ")[0],
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${location?.name} ${location?.region} , ${location?.country}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https:${weatherModal?.current.condition.icon}"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text(
                      "${current?.tempC} °C",
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${current?.condition.text}",
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 90,
                        ),
                        const Text("Wind",
                            style:
                                TextStyle(fontSize: 22, color: Colors.white)),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${current?.windKph}km/h",
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 90,
                        ),
                        const Text("Preciption",
                            style:
                                TextStyle(fontSize: 22, color: Colors.white)),
                        const SizedBox(
                          width: 20,
                        ),
                        Text("${current?.precipIn}%",
                            style: const TextStyle(
                                fontSize: 22, color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const Expanded(
                          child: Text("Humidity  ",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                        Expanded(
                          child: Text("  ${current?.humidity}%",
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.white)),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hourly Broadcast",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: forecastday?.hour.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blue,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(
                                          "http:${forecastday?.hour[index].condition.icon}"),
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                  Text(
                                    "${forecastday?.hour[index].time}"
                                        .split(" ")[1],
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  Text(
                                    "Temp c :${forecastday?.hour[index].tempC}",
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  Text(
                                    "Temp F :${forecastday?.hour[index].tempF}",
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
