// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class NorthwindEntities<Provider: DataServiceProvider>: DataService<Provider> {

    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = NorthwindEntitiesMetadata.document
    }

    open func alphabeticalListOfProducts(query: DataQuery = DataQuery()) throws -> Array<AlphabeticalListOfProduct> {
        return try AlphabeticalListOfProduct.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.alphabeticalListOfProducts)).entityList())
    }

    open func alphabeticalListOfProducts(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<AlphabeticalListOfProduct>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<AlphabeticalListOfProduct> = try self.alphabeticalListOfProducts(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func categories(query: DataQuery = DataQuery()) throws -> Array<Category> {
        return try Category.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.categories)).entityList())
    }

    open func categories(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Category>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Category> = try self.categories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func categorySalesFor1997(query: DataQuery = DataQuery()) throws -> Array<CategorySalesFor1997> {
        return try CategorySalesFor1997.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.categorySalesFor1997)).entityList())
    }

    open func categorySalesFor1997(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<CategorySalesFor1997>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<CategorySalesFor1997> = try self.categorySalesFor1997(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func currentProductLists(query: DataQuery = DataQuery()) throws -> Array<CurrentProductList> {
        return try CurrentProductList.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.currentProductLists)).entityList())
    }

    open func currentProductLists(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<CurrentProductList>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<CurrentProductList> = try self.currentProductLists(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func customerAndSuppliersByCities(query: DataQuery = DataQuery()) throws -> Array<CustomerAndSuppliersByCity> {
        return try CustomerAndSuppliersByCity.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.customerAndSuppliersByCities)).entityList())
    }

    open func customerAndSuppliersByCities(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<CustomerAndSuppliersByCity>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<CustomerAndSuppliersByCity> = try self.customerAndSuppliersByCities(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func customerDemographics(query: DataQuery = DataQuery()) throws -> Array<CustomerDemographic> {
        return try CustomerDemographic.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.customerDemographics)).entityList())
    }

    open func customerDemographics(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<CustomerDemographic>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<CustomerDemographic> = try self.customerDemographics(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func customers(query: DataQuery = DataQuery()) throws -> Array<Customer> {
        return try Customer.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.customers)).entityList())
    }

    open func customers(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Customer>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Customer> = try self.customers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func employees(query: DataQuery = DataQuery()) throws -> Array<Employee> {
        return try Employee.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.employees)).entityList())
    }

    open func employees(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Employee>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Employee> = try self.employees(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func invoices(query: DataQuery = DataQuery()) throws -> Array<Invoice> {
        return try Invoice.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.invoices)).entityList())
    }

    open func invoices(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Invoice>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Invoice> = try self.invoices(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func orderDetails(query: DataQuery = DataQuery()) throws -> Array<OrderDetail> {
        return try OrderDetail.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.orderDetails)).entityList())
    }

    open func orderDetails(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<OrderDetail>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderDetail> = try self.orderDetails(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func orderDetailsExtendeds(query: DataQuery = DataQuery()) throws -> Array<OrderDetailsExtended> {
        return try OrderDetailsExtended.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.orderDetailsExtendeds)).entityList())
    }

    open func orderDetailsExtendeds(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<OrderDetailsExtended>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderDetailsExtended> = try self.orderDetailsExtendeds(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func orderSubtotals(query: DataQuery = DataQuery()) throws -> Array<OrderSubtotal> {
        return try OrderSubtotal.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.orderSubtotals)).entityList())
    }

    open func orderSubtotals(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<OrderSubtotal>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<OrderSubtotal> = try self.orderSubtotals(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func orders(query: DataQuery = DataQuery()) throws -> Array<Order> {
        return try Order.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.orders)).entityList())
    }

    open func orders(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Order>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Order> = try self.orders(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func ordersQries(query: DataQuery = DataQuery()) throws -> Array<OrdersQry> {
        return try OrdersQry.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.ordersQries)).entityList())
    }

    open func ordersQries(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<OrdersQry>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<OrdersQry> = try self.ordersQries(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productSalesFor1997(query: DataQuery = DataQuery()) throws -> Array<ProductSalesFor1997> {
        return try ProductSalesFor1997.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.productSalesFor1997)).entityList())
    }

    open func productSalesFor1997(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<ProductSalesFor1997>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductSalesFor1997> = try self.productSalesFor1997(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func products(query: DataQuery = DataQuery()) throws -> Array<Product> {
        return try Product.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.products)).entityList())
    }

    open func products(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Product>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Product> = try self.products(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productsAboveAveragePrices(query: DataQuery = DataQuery()) throws -> Array<ProductsAboveAveragePrice> {
        return try ProductsAboveAveragePrice.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.productsAboveAveragePrices)).entityList())
    }

    open func productsAboveAveragePrices(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<ProductsAboveAveragePrice>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductsAboveAveragePrice> = try self.productsAboveAveragePrices(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func productsByCategories(query: DataQuery = DataQuery()) throws -> Array<ProductsByCategory> {
        return try ProductsByCategory.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.productsByCategories)).entityList())
    }

    open func productsByCategories(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<ProductsByCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<ProductsByCategory> = try self.productsByCategories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func regions(query: DataQuery = DataQuery()) throws -> Array<Region> {
        return try Region.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.regions)).entityList())
    }

    open func regions(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Region>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Region> = try self.regions(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesByCategories(query: DataQuery = DataQuery()) throws -> Array<SalesByCategory> {
        return try SalesByCategory.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.salesByCategories)).entityList())
    }

    open func salesByCategories(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<SalesByCategory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesByCategory> = try self.salesByCategories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func salesTotalsByAmounts(query: DataQuery = DataQuery()) throws -> Array<SalesTotalsByAmount> {
        return try SalesTotalsByAmount.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.salesTotalsByAmounts)).entityList())
    }

    open func salesTotalsByAmounts(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<SalesTotalsByAmount>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<SalesTotalsByAmount> = try self.salesTotalsByAmounts(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func shippers(query: DataQuery = DataQuery()) throws -> Array<Shipper> {
        return try Shipper.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.shippers)).entityList())
    }

    open func shippers(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Shipper>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Shipper> = try self.shippers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func summaryOfSalesByQuarters(query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByQuarter> {
        return try SummaryOfSalesByQuarter.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByQuarters)).entityList())
    }

    open func summaryOfSalesByQuarters(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<SummaryOfSalesByQuarter>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<SummaryOfSalesByQuarter> = try self.summaryOfSalesByQuarters(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func summaryOfSalesByYears(query: DataQuery = DataQuery()) throws -> Array<SummaryOfSalesByYear> {
        return try SummaryOfSalesByYear.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.summaryOfSalesByYears)).entityList())
    }

    open func summaryOfSalesByYears(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<SummaryOfSalesByYear>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<SummaryOfSalesByYear> = try self.summaryOfSalesByYears(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func suppliers(query: DataQuery = DataQuery()) throws -> Array<Supplier> {
        return try Supplier.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.suppliers)).entityList())
    }

    open func suppliers(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Supplier>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Supplier> = try self.suppliers(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func territories(query: DataQuery = DataQuery()) throws -> Array<Territory> {
        return try Territory.array(from: self.executeQuery(query.from(NorthwindEntitiesMetadata.EntitySets.territories)).entityList())
    }

    open func territories(query: DataQuery = DataQuery(), completionHandler: @escaping(Array<Territory>?, Error?) -> Void) -> Void {
        self.addBackgroundOperation {
            do {
                let result: Array<Territory> = try self.territories(query: query)
                OperationQueue.main.addOperation {
                    completionHandler(result, nil)
                }
            }
            catch let error {
                OperationQueue.main.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
