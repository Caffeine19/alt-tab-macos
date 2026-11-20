import CoreGraphics
import XCTest

final class WindowCaptureGeometryTests: XCTestCase {
    func testRejectsProjectedStageManagerCard() {
        let visual = CGSize(width: 204, height: 191)
        let logical = CGSize(width: 2544, height: 1394)
        XCTAssertTrue(WindowCaptureGeometry.isProjected(visual, relativeTo: logical))
    }

    func testRejectsProjectionWithOneMatchingDimension() {
        let visual = CGSize(width: 204, height: 191)
        let logical = CGSize(width: 204, height: 420)
        XCTAssertTrue(WindowCaptureGeometry.isProjected(visual, relativeTo: logical))
    }

    func testAcceptsWindowAfterItReturnsToFullSize() {
        let logical = CGSize(width: 2544, height: 1394)
        XCTAssertFalse(WindowCaptureGeometry.isProjected(logical, relativeTo: logical))
    }

    func testAcceptsSmallBoundsDifferences() {
        let visual = CGSize(width: 102, height: 97)
        let logical = CGSize(width: 100, height: 100)
        XCTAssertFalse(WindowCaptureGeometry.isProjected(visual, relativeTo: logical))
    }

    func testMissingBoundsDoNotClassifyTheWindowAsProjected() {
        let logical = CGSize(width: 300, height: 400)
        XCTAssertFalse(WindowCaptureGeometry.isProjected(.zero, relativeTo: logical))
    }
}
