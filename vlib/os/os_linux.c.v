// Copyright (c) 2019-2022 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module os

const (
	prot_read     = 1
	prot_write    = 2
	map_private   = 0x02
	map_anonymous = 0x20
)

pub const (
	sys_write = 1
	sys_open  = 2
	sys_close = 3
	sys_mkdir = 83
	sys_creat = 85
)

pub struct Stat {
pub:
	dev     u64
	ino     u64
	nlink   u64
	mode    u32
	uid     u32
	gid     u32
	rdev    u64
	size    u64
	blksize u64
	blocks  u64
	atime   i64
	mtime   i64
	ctime   i64
}