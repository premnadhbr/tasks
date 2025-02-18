import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/widgets/customIcon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../controller/home/bloc/home_bloc.dart';
import '../../controller/home/bloc/home_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(CategoryInitialFetchEvent());
    super.initState();
    // BlocProvider.of<HomeBloc>(context).add(CategoryInitialFetchEvent());
    // BlocProvider.of<HomeBloc>(context).add(HomeProductsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20.sp),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Shammas",
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Let's start shopping"),
                ],
              ),
              Row(
                children: [
                  CustomIconContainer(icon: CupertinoIcons.heart),
                  SizedBox(
                    width: 2.w,
                  ),
                  CustomIconContainer(icon: CupertinoIcons.bell)
                ],
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                prefixIcon: Icon(Icons.search),
                hintText: "Search"),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 23.h,
            child: Placeholder(),
            decoration: BoxDecoration(),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case CategoriesFetchSuccessfulState:
                  final successState = state as CategoriesFetchSuccessfulState;
                  return SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successState.categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            children: [
                              CircleAvatar(radius: 22.sp),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                successState.categories[index].categoryName
                                    .toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              Text(
                "View All",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeProductsFetchSuccessfulState:
                  final successState =
                      state as HomeProductsFetchSuccessfulState;
                  return SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            children: [
                              Text(
                                successState.products[index].name.toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
