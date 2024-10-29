
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stock_bloc.dart';
import 'stock_store.dart';

class StockSearchScreen extends StatelessWidget {
  const StockSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => StockBloc()..add(LoadStocks()),
        child: StockSearch(),
      ),
    );
  }
}

class StockSearch extends StatelessWidget {
  final StockStore stockStore = StockStore();

  StockSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                stockStore.updateSearchQuery(value);
                context.read<StockBloc>().add(SearchStock(value));
              },
              decoration: InputDecoration(labelText: 'Search Symbol'),
            ),
          ),
          Expanded(
            child: BlocBuilder<StockBloc, StockState>(
              builder: (context, state) {
                if (state is StocksLoaded) {
                  final filteredStocks = state.stocks;
                  return ListView.builder(
                    itemCount: filteredStocks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredStocks[index].symbol),
                        subtitle: Text(filteredStocks[index].exchange),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
