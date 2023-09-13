[Back](README.md)

## Supply Chain Forecast

<hr>


### 1. Retailer Inventory Forecast

- Scenario 1:

    > A steady 100 units per week demand coming from your end consumers. You keep a stock target of four weeks of inventory, and you order around 100 units per week from your manufacturer (100×4=400 units).

![](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/data_science/forecast/retail_inventory_forecast1.png)

<hr>

- Scenario 2:

    > Consumer demand decreased by 10% per week (to 90 units). Your current inventory target is around four weeks of inventory. Hence, you estimate to have 40 units too much in stock (you currently have 400 pieces in stock and want to have 360). So, as you stick to your inventory policy, you will decrease your next order by 50 units (40 units because of overstock and 10 units because of your reduced forecast).

![Inventory Forecast 2](https://raw.githubusercontent.com/Elliot518/mcp-oss-repo/main/data_science/forecast/retail_inventory_forecast.png)


#### Conclusion:
> The slightest final client demand variation could result in a massive variation at the manufacturer’s end.

