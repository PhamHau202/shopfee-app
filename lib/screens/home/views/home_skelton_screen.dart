import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopfee_app/route/route_constants.dart';

class HomeSkeletonScreen extends StatefulWidget {
  const HomeSkeletonScreen({super.key});

  @override
  State<HomeSkeletonScreen> createState() => _HomeSkeletonScreenState();
}

class _HomeSkeletonScreenState extends State<HomeSkeletonScreen> {

  @override
  void initState() {
    super.initState();
    // Delay 3s then show content
    Future.delayed(const Duration(seconds: 3), () {
       Navigator.pushNamed(context, entryPointScreenRoute);
    });
  }

  Widget _buildSkeleton({double height = 20, double width = double.infinity, BorderRadius? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildRealContent({double height = 20, double width = double.infinity, Color color = Colors.brown}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [                
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child:  _buildSkeleton(height: 40)),
                    const SizedBox(width: 8),
                    _buildSkeleton(height: 40, width: 40),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSkeleton(height: 140),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _buildSkeleton(height: 60) ),
                    const SizedBox(width: 8),
                    Expanded(child: _buildSkeleton(height: 60) ),
                    const SizedBox(width: 8),
                    Expanded(child: _buildSkeleton(height: 60) ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildSkeleton(height: 40),
                const SizedBox(height: 12),
                _buildSkeleton(height: 100),
                const SizedBox(height: 12),
                _buildSkeleton(height: 100),
                const SizedBox(height: 12),
                _buildSkeleton(height: 100),
                const SizedBox(height: 12),
                _buildSkeleton(height: 100),
                const SizedBox(height: 12),
                _buildSkeleton(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}