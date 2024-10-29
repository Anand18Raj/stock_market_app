
import 'package:flutter/material.dart';

import 'stock_search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // setup a theme
      theme: ThemeData.dark(), 
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
  appBar: AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    title: const Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Portfolio', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('May 21', style: TextStyle(color: Colors.grey)),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0), // Adjust as needed
        child:IconButton(
  icon: const Icon(Icons.search),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StockSearchScreen()),
    );
  },
),

      ),
    ],
  ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMarketRow('Dow Jones', '24,527.33', '-48.57', Colors.red),
            _buildMarketRow('S&P 500', '2,957.39', '-14.22', Colors.red),
            _buildMarketRow('NASDAQ', '9,326.69', '-49.08', Colors.red),
            const SizedBox(height: 20),
            _buildStockCard('BLK', 'BlackRock, Inc.', '-1.073', '507.668', Colors.red),
            _buildStockCard('ADP', 'Automatic Data Processing, Inc.', '-0.985', '133.795', Colors.red),
            _buildStockCard('O', 'Realty Income Corporation', '+0.74', '52.18', Colors.green),
            _buildStockCard('FB', 'Facebook, Inc.', '+2.68', '232.65', Colors.green),
            _buildStockCard('MSFT', 'Microsoft Corporation', '-1.31', '184.35', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketRow(String name, String value, String change, Color changeColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 16)),
            Text(change, style: TextStyle(color: changeColor, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  Widget _buildStockCard(String symbol, String companyName, String change, String price, Color changeColor) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text(companyName, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(change, style: TextStyle(color: changeColor, fontSize: 16, fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



