import 'dart:async';

import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_demo/core/themes/app_colors.dart';
import 'package:flutter_store_demo/core/themes/app_fonts.dart';
import 'package:flutter_store_demo/core/widgets/cached_image.dart';
import 'package:flutter_store_demo/core/widgets/gl_app_bar.dart';
import 'package:flutter_store_demo/features/home/data/models/product_model.dart';
import 'package:flutter_store_demo/features/home/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();
  String searchQuery = '';
  Timer? _debounce;

  int? selectedCategoryIndex;
  String? selectedCategory;
  String? selectedCategoryName;

  final ScrollController _scrollProductController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollProductController.addListener(_onProductScroll);
    _fetchProducts();
  }

  void _fetchProducts() {
    context.read<ProductBloc>().add(
      GetAllProducts(
        offset: 0,
        limit: 20,
        search: searchQuery.isEmpty ? null : searchQuery,
        categoryId: selectedCategory,
      ),
    );
  }

  void _onProductScroll() {
    if (_isProductEnd) {
      final state = context.read<ProductBloc>().state;

      if (state is ProductSuccess &&
          !state.hasReachedMax &&
          !state.isLoadingMore) {
        context.read<ProductBloc>().add(
          GetAllProducts(
            offset: state.products.length,
            limit: 20,
            categoryId: selectedCategory,
            search: searchQuery.isEmpty ? null : searchQuery,
          ),
        );
      }
    }
  }

  bool get _isProductEnd {
    if (!_scrollProductController.hasClients) return false;

    final maxScroll = _scrollProductController.position.maxScrollExtent;
    final currentScroll = _scrollProductController.offset;
    return currentScroll >= maxScroll - 100;
  }

  void _onRefresh() {
    _fetchProducts();
  }

  // void _onOpenDetailOrder(Size size, ProductModel product) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: AppColors.white,
  //     isScrollControlled: true,
  //     isDismissible: false,
  //     builder: (context) {
  //       return Container(
  //         height: size.height * 0.85,
  //         padding: EdgeInsets.all(15),
  //         child: ProductOrderSheet(product: product, textTab: ''),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    _scrollProductController.dispose();
    _debounce?.cancel();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppbar(context, size),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          backgroundColor: Colors.white,
          onRefresh: () async => _onRefresh(),
          child: CustomScrollView(
            controller: _scrollProductController,
            slivers: [
              SliverToBoxAdapter(child: Gap(10)),
              buildProductsSliver(),
              SliverToBoxAdapter(child: Gap(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductsSliver() {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading && state is! ProductSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return FadeShimmer(
                  width: size.width,
                  height: 189,
                  radius: 10,
                  fadeTheme: FadeTheme.light,
                );
              }, childCount: 6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
            ),
          );
        }

        if (state is ProductError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.message,
                style: AppFonts.w500f16.copyWith(color: AppColors.grey),
              ),
            ),
          );
        }

        if (state is ProductSuccess) {
          if (state.products.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Нет продуктов',
                  textAlign: TextAlign.center,
                  style: AppFonts.w500f16.copyWith(color: AppColors.grey),
                ),
              ),
            );
          }

          return SliverMainAxisGroup(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => buildProductCard(state.products[index]),
                    childCount: state.products.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                ),
              ),
              if (!state.hasReachedMax)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }

        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }

  Widget buildProductCard(ProductModel product) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => (),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: AppColors.grey3.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(12),
                ),
                child: CachedImage(
                  imageUrl: product.imageUrl,
                  width: size.width,
                ),
              ),
            ),
            Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 15,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.w400f14,
                        ),
                        if (product.price != null) ...[
                          Text(
                            '${product.price} сом',
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.w600f16,
                          ),
                        ],
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => (),
                    child: Icon(Icons.add, color: AppColors.primary),
                  ),
                ],
              ),
            ),
            Gap(15),
          ],
        ),
      ),
    );
  }

  GlAppBar buildAppbar(BuildContext context, Size size) {
    return GlAppBar(
      leading: Row(
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: AppColors.grey),
          ),
          Text('Меню', style: AppFonts.w500f24),
        ],
      ),
      action: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {},
          child: IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Row(
                spacing: 4,
                children: [
                  Icon(Icons.location_on, color: AppColors.primary),
                  Flexible(
                    child: Text(
                      'Выберите филиал',
                      style: AppFonts.w500f16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
