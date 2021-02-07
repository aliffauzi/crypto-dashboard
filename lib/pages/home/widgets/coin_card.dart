import 'package:crypto_dashboard/models/coin.dart';
import 'package:flutter/material.dart';
import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  CoinCard({this.coin});
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      height: 90.0.h,
      color: Color.fromRGBO(55, 66, 92, 0.4),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          Container(
            width: 40.0.w,
            child: Image.asset(
              coin.getImagePath(),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${coin.toString()} (${coin.getCoinAbbr()})",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "\$${coin.currentPrice}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${coin.balance}",
                                style: themeData.textTheme.caption
                                    .copyWith(fontSize: 14.0),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    getCoinProgress(coin),
                                    style: TextStyle(
                                      color: coin.trend == Trend.UP
                                          ? Color.fromRGBO(97, 201, 200, 1)
                                          : Color.fromRGBO(247, 71, 104, 1),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Icon(
                                    coin.trend == Trend.UP
                                        ? FlutterIcons.caret_up_faw
                                        : FlutterIcons.caret_down_faw,
                                    size: 14.0,
                                    color: Color.fromRGBO(97, 201, 200, 1),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

String getCoinProgress(Coin coin) {
  String returnValue = "";

  if (coin.trend == Trend.UP) {
    returnValue += "+";
  } else {
    returnValue += "-";
  }

  returnValue += "\$${coin.amountProgress} (${coin.percentProgress}%)";

  return returnValue;
}