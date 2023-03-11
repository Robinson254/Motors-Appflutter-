import 'package:flutter/material.dart';
import 'package:motors/Screens/list.dart';
class Motor extends StatefulWidget {
   Motor({super.key});

  @override
  State<Motor> createState() => _MotorState();
}

class _MotorState extends State<Motor> {
 List _FoundCars=[];
    @override
    void initState(){
      _FoundCars=Vehicles;
    }

void _runFilter(String enterKeyWord){
    List _Result=[];
      if(enterKeyWord.isEmpty){
        _Result =Vehicles;
      }

      else{
        _Result=Vehicles.where((cars) => 
        cars['name'].toLowerCase().contains(enterKeyWord.toLowerCase())).toList();
      }
      setState(() {
        _FoundCars=_Result;
      });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.yellow[400],
        leading: Icon(Icons.short_text),
        title: TextFormField(
          onChanged: (value) {
            _runFilter(value);
          },
          
          decoration: InputDecoration(
            fillColor:Colors.redAccent,
            hintText: "AfricMotors",
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
          
        ),
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add),
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          itemCount: _FoundCars.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.85,
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ), 
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Colors.blue[50],
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(_FoundCars[index]['image']),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_FoundCars[index]['name']),
                        
                      ),
                      Text(_FoundCars[index]['price']),
                    ],
                  ),
                ),),
            );
          })),
      ),
    );
  }
}