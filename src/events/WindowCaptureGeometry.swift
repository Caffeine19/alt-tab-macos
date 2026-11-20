import CoreGraphics

enum WindowCaptureGeometry {
    static func isProjected(_ visual: CGSize, relativeTo logical: CGSize) -> Bool {
        guard visual.width > 0, visual.height > 0, logical.width > 0, logical.height > 0 else { return false }
        return differs(visual.width, logical.width) || differs(visual.height, logical.height)
    }

    private static func differs(_ visual: CGFloat, _ logical: CGFloat) -> Bool {
        abs(visual - logical) > max(4, logical * 0.1)
    }
}
