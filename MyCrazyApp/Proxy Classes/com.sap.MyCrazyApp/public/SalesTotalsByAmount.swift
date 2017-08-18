// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class SalesTotalsByAmount: EntityValue {
    public static let saleAmount: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "SaleAmount")

    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "OrderID")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "CompanyName")

    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount.property(withName: "ShippedDate")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.salesTotalsByAmount)
    }

    open class func array(from: EntityValueList) -> Array<SalesTotalsByAmount> {
        return ArrayConverter.convert(from.toArray(), Array<SalesTotalsByAmount>())
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SalesTotalsByAmount.companyName))
        }
        set(value) {
            self.setDataValue(for: SalesTotalsByAmount.companyName, to: StringValue.of(value))
        }
    }

    open func copy() -> SalesTotalsByAmount {
        return CastRequired<SalesTotalsByAmount>.from(self.copyEntity())
    }

    open class func key(companyName: String, orderID: Int) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(companyName)).with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: SalesTotalsByAmount {
        get {
            return CastRequired<SalesTotalsByAmount>.from(self.oldEntity)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: SalesTotalsByAmount.orderID))
        }
        set(value) {
            self.setDataValue(for: SalesTotalsByAmount.orderID, to: IntValue.of(value))
        }
    }

    open var saleAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: SalesTotalsByAmount.saleAmount))
        }
        set(value) {
            self.setDataValue(for: SalesTotalsByAmount.saleAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: SalesTotalsByAmount.shippedDate))
        }
        set(value) {
            self.setDataValue(for: SalesTotalsByAmount.shippedDate, to: value)
        }
    }
}
