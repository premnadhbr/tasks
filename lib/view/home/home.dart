import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/items/bloc/items_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(CategoryInitialFetchEvent());
    BlocProvider.of<ItemsBloc>(context).add(HomeProductsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(width: 2.w),
                      CustomIconContainer(icon: CupertinoIcons.bell),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                height: 23.h,
                decoration: BoxDecoration(),
                child: Placeholder(),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  print(state);
                  if (state is CategoriesFetchSuccessfulState) {
                    return SizedBox(
                      height: 13.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Column(
                              children: [
                                CircleAvatar(radius: 22.sp),
                                SizedBox(height: 1.h),
                                Text(
                                  state.categories[index].categoryName
                                      .toString(),
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              BlocBuilder<ItemsBloc, ItemsState>(
                builder: (context, state) {
                  print(state);
                  if (state is HomeProductsFetchSuccessfulState) {
                    return GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // Disable inner scrolling
                      shrinkWrap: true, // Let GridView take only needed height
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 140,
                                child: Placeholder(),
                              ),
                              Column(
                                children: [
                                  Text(
                                    state.products[index].name,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "RS.${state.products[index].price.toString()}",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state.products[index].description,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.shopping_bag_rounded,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
