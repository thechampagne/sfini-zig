// Copyright 2023 XXIV
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
pub const INI_GLOBAL_SECTION = @as(c_int, 0);
pub const INI_NOT_FOUND = -@as(c_int, 1);

pub const ini_t = opaque {};

pub extern "C" fn ini_create(memctx: ?*anyopaque) ?*ini_t;
pub extern "C" fn ini_load(data: [*c]const u8, memctx: ?*anyopaque) ?*ini_t;
pub extern "C" fn ini_save(ini: ?*const ini_t, data: [*c]u8, size: c_int) c_int;
pub extern "C" fn ini_destroy(ini: ?*ini_t) void;
pub extern "C" fn ini_section_count(ini: ?*const ini_t) c_int;
pub extern "C" fn ini_section_name(ini: ?*const ini_t, section: c_int) [*c]const u8;
pub extern "C" fn ini_property_count(ini: ?*const ini_t, section: c_int) c_int;
pub extern "C" fn ini_property_name(ini: ?*const ini_t, section: c_int, property: c_int) [*c]const u8;
pub extern "C" fn ini_property_value(ini: ?*const ini_t, section: c_int, property: c_int) [*c]const u8;
pub extern "C" fn ini_find_section(ini: ?*const ini_t, name: [*c]const u8, name_length: c_int) c_int;
pub extern "C" fn ini_find_property(ini: ?*const ini_t, section: c_int, name: [*c]const u8, name_length: c_int) c_int;
pub extern "C" fn ini_section_add(ini: ?*ini_t, name: [*c]const u8, length: c_int) c_int;
pub extern "C" fn ini_property_add(ini: ?*ini_t, section: c_int, name: [*c]const u8, name_length: c_int, value: [*c]const u8, value_length: c_int) void;
pub extern "C" fn ini_section_remove(ini: ?*ini_t, section: c_int) void;
pub extern "C" fn ini_property_remove(ini: ?*ini_t, section: c_int, property: c_int) void;
pub extern "C" fn ini_section_name_set(ini: ?*ini_t, section: c_int, name: [*c]const u8, length: c_int) void;
pub extern "C" fn ini_property_name_set(ini: ?*ini_t, section: c_int, property: c_int, name: [*c]const u8, length: c_int) void;
pub extern "C" fn ini_property_value_set(ini: ?*ini_t, section: c_int, property: c_int, value: [*c]const u8, length: c_int) void;
