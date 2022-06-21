
import 'package:bloc_wall_street_news/controllers/counterBloc.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {


  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Chnaging value through BLoC',
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                // if(snapshot.hasData)
                 return Text(
                   '${snapshot.data}',
                   style: Theme.of(context).textTheme.headline4,
                 );
                // else if(snapshot.hasError)
                //   return Text(
                //     '${snapshot.error}',
                //   );
                })

          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Increment);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.loop),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



