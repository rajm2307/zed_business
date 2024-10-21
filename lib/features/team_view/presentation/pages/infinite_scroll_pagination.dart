// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:lottie/lottie.dart';

// typedef FetchDataFunction = Function(int currentPage);
// typedef FunctionShowList = Function(dynamic);

// class InfiniteScrollPagination extends StatefulWidget {
//   final ScrollController scrollController;
//   final FetchDataFunction fetchDataFunction;
//   final FunctionShowList showList;
//   const InfiniteScrollPagination(
//       {Key? key,
//       required this.scrollController,
//       required this.fetchDataFunction,
//       required this.showList})
//       : super(key: key);

//   @override
//   State<InfiniteScrollPagination> createState() =>
//       _InfiniteScrollPaginationState();
// }

// class _InfiniteScrollPaginationState extends State<InfiniteScrollPagination> {
//   final StreamController<List<dynamic>> _dataStreamController =
//       StreamController<List<dynamic>>();
//   Stream<List<dynamic>> get dataStream => _dataStreamController.stream;
//   final List<dynamic> _currentItems = [];
//   int _currentPage = 1;
//   bool _reachedEnd = false;
//   late final ScrollController _scrollController;
//   bool _isFetchingData = false;

//   Future<void> _fetchPaginatedData() async {
//     if (_isFetchingData || _reachedEnd) {
//       // Avoid fetching new data while already fetching
//       return;
//     }
//     try {
//       _isFetchingData = true;
//       setState(() {});

//       // final startTime = DateTime.now();

//       final items = await widget.fetchDataFunction(_currentPage);
//       _currentItems.addAll(items);

//       // // Add the updated list to the stream without overwriting the previous data
//       // final endTime = DateTime.now();
//       // final timeDifference =
//       //     endTime.millisecondsSinceEpoch - startTime.millisecondsSinceEpoch;

//       // if (timeDifference < 2000) {
//       //   // Delay for 2 seconds if the time taken by the API request is less then 2 seconds
//       //   await Future.delayed(const Duration(milliseconds: 2000));
//       // }

//       if (items.isEmpty && _currentPage > 1) {
//         _reachedEnd = true;
//       } else {
//         // print('s');
//         _dataStreamController.add(_currentItems);
//         _currentPage++;
//       }
//     } catch (e) {
//       if (!_dataStreamController.isClosed) {
//         _dataStreamController.addError(e);
//       }
//     } finally {
//       // Set to false when data fetching is complete
//       _isFetchingData = false;
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = widget.scrollController;
//     _fetchPaginatedData();
//     _scrollController.addListener(() {
//       _scrollController.addListener(() {
//         final maxScroll = _scrollController.position.maxScrollExtent;
//         final currentScroll = _scrollController.position.pixels;

//         if (currentScroll >= maxScroll) {
//           // When the last item is fully visible, load the next page.
//           _fetchPaginatedData();
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<dynamic>>(
//       stream: dataStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Display a loading indicator
//           return Center(
//             child: LoadingAnimationWidget.staggeredDotsWave(
//                 color: primaryColor, size: 50),
//           );
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           // Display a message when there is no data
//           return Center(
//               child: Lottie.asset('assets/animations/no_data.json',
//                   width: MediaQuery.of(context).size.width - 100));
//         } else {
//           // Display the paginated data
//           final items = snapshot.data;
//           return ListView(
//             controller: _scrollController,
//             children: [
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: items!.length,
//                 itemBuilder: (context, index) {
//                   return widget.showList(items[index]);
//                 },
//               ),
//               if (_isFetchingData)
//                 Center(
//                   child: LoadingAnimationWidget.staggeredDotsWave(
//                       color: primaryColor, size: 50),
//                 ),
//               if (_reachedEnd)
//                 const Center(
//                   child: Text(
//                     'You have reached the end of the list.',
//                     style: TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                 )
//             ],
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _dataStreamController.close();
//     //we do not have control cover the _scrollController so it should not be disposed here
//     // _scrollController.dispose();
//     super.dispose();
//   }
// }
