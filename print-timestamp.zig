const std = @import("std");

pub fn main() anyerror!void {
    var stdout = std.io.getStdOut();
    var writer = stdout.writer();
    const timestamp = std.time.milliTimestamp();
    writer.print("{d}", .{timestamp}) catch unreachable;
}
