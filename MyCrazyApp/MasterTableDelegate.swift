//
// MasterTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//

import Foundation
import SAPOData
import SAPFiori

protocol MasterTableDelegate: UITableViewDelegate, UITableViewDataSource {
    var entities: [EntityValue] { get set }

    func requestEntities(completionHandler: @escaping(Error?) -> Void)

    weak var notifier: Notifier? { get set }
}

extension MasterTableDelegate {

    func cellWithNonEditableContent(tableView: UITableView, indexPath: IndexPath, key: String, value: String) -> FUIObjectTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as! FUIObjectTableViewCell
        cell.headlineText = value
        cell.footnoteText = key
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension MasterViewController {

    func generatedTableDelegate() -> MasterTableDelegate? {
        switch collectionType {
        case .orders:
            return OrdersMasterTableDelegate(dataAccess: self.northwindEntities)
        case .salesByCategories:
            return SalesByCategoriesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .invoices:
            return InvoicesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .ordersQries:
            return OrdersQriesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .employees:
            return EmployeesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .alphabeticalListOfProducts:
            return AlphabeticalListOfProductsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .summaryOfSalesByQuarters:
            return SummaryOfSalesByQuartersMasterTableDelegate(dataAccess: self.northwindEntities)
        case .regions:
            return RegionsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .productsAboveAveragePrices:
            return ProductsAboveAveragePricesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .suppliers:
            return SuppliersMasterTableDelegate(dataAccess: self.northwindEntities)
        case .categorySalesFor1997:
            return CategorySalesFor1997MasterTableDelegate(dataAccess: self.northwindEntities)
        case .salesTotalsByAmounts:
            return SalesTotalsByAmountsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .customerDemographics:
            return CustomerDemographicsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .orderDetailsExtendeds:
            return OrderDetailsExtendedsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .territories:
            return TerritoriesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .summaryOfSalesByYears:
            return SummaryOfSalesByYearsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .productsByCategories:
            return ProductsByCategoriesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .customerAndSuppliersByCities:
            return CustomerAndSuppliersByCitiesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .currentProductLists:
            return CurrentProductListsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .categories:
            return CategoriesMasterTableDelegate(dataAccess: self.northwindEntities)
        case .productSalesFor1997:
            return ProductSalesFor1997MasterTableDelegate(dataAccess: self.northwindEntities)
        case .orderDetails:
            return OrderDetailsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .customers:
            return CustomersMasterTableDelegate(dataAccess: self.northwindEntities)
        case .orderSubtotals:
            return OrderSubtotalsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .products:
            return ProductsMasterTableDelegate(dataAccess: self.northwindEntities)
        case .shippers:
            return ShippersMasterTableDelegate(dataAccess: self.northwindEntities)
        default:
            return nil
        }
    }
}
