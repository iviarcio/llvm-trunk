// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s


// ------------------------------------------------------------------------- //
// Invalid predicate

fnmad z0.h, p8/m, z1.h, z2.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: restricted predicate has range [0, 7].
// CHECK-NEXT: fnmad z0.h, p8/m, z1.h, z2.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// ------------------------------------------------------------------------- //
// Invalid element width

fnmad z0.s, p7/m, z1.h, z2.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: fnmad z0.s, p7/m, z1.h, z2.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

fnmad z0.b, p7/m, z1.b, z2.b
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: fnmad z0.b, p7/m, z1.b, z2.b
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// ------------------------------------------------------------------------- //
// Element index is not allowed

fnmad z0.h, p7/m, z1.h, z2.h[0]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand
// CHECK-NEXT: fnmad z0.h, p7/m, z1.h, z2.h[0]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:
