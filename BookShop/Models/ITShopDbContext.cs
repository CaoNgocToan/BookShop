using Microsoft.EntityFrameworkCore;

namespace BookShop.Models
{
    public class BookShopDbContext : DbContext
    {
        public BookShopDbContext(DbContextOptions<BookShopDbContext> options) : base(options) { }
        public DbSet<LoaiSanPham> LoaiSanPham { get; set; }
        public DbSet<HangSanXuat> HangSanXuat { get; set; }
        public DbSet<SanPham> SanPham { get; set; }
        public DbSet<NguoiDung> NguoiDung { get; set; }
        public DbSet<TinhTrang> TinhTrang { get; set; }
        public DbSet<DatHang> DatHang { get; set; }
        public DbSet<DatHang_ChiTiet> DatHang_ChiTiet { get; set; }
		public DbSet<GioHang> GioHang { get; set; }
		public DbSet<ChuDe> ChuDe { get; set; }
		public DbSet<BaiViet> BaiViet { get; set; }
		public DbSet<BinhLuanBaiViet> BinhLuanBaiViet { get; set; }

	
	}
}
