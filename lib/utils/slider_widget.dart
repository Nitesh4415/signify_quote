import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_app/utils/ui_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../bloc/saved_quotes_screen/saved_quote_cubit.dart';
import '../data/model/quote.dart';
import '../ui/home/widgets/text_container/text_container.dart';

class FullscreenSliderDemo extends StatefulWidget {
  const FullscreenSliderDemo({Key? key}) : super(key: key);

  @override
  FullscreenSliderDemoState createState() => FullscreenSliderDemoState();
}

class FullscreenSliderDemoState extends State<FullscreenSliderDemo> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SavedQuotesCubit>(context).getAllSavedQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signify",style: TextStyle(color: Colors.black),),actions: [
        IconButton(
          icon: const Icon(Icons.close,color:Colors.black,),
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              UiStrings.savedQuotesScreenRoute,
            );
          },
        ),
      ],),
      body: BlocBuilder<SavedQuotesCubit, SavedQuoteState>(
        builder: (BuildContext context, state){
          if (state is SavedQuotesLoaded) {
            return getSlider(context,state.savedQuotes!);
          } else if (state is NoSavedQuotes) {
            return const Center(
              child: Text(UiStrings.savedQuoteScreenNoData),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget getSlider(BuildContext context,List<Quote> savedQuotes){
    final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: savedQuotes
          .map((item) => TextContainer(randomQuote: item))
          .toList(),
    );
  }
}
