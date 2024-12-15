using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SlugGenerator;
using BookShop.Models;
namespace BookShop.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: ChiTiet
        public IActionResult ChiTiet(string tenLoai, string tenSanPham)
        {
            var sanPham = _context.SanPham
            .Include(s => s.HangSanXuat)
            .Include(s => s.LoaiSanPham)
            .Where(r => r.TenSanPhamKhongDau == tenSanPham).SingleOrDefault();
            if (sanPham == null)
                return NotFound();
            else
                return View(sanPham);
        }
        // GET: PhanLoai
        public IActionResult PhanLoai(string tenLoai, int? trang)
        {
            var danhSachPhanLoai = LayDanhSachSanPhamTheoPhanLoai(tenLoai, trang ?? 1);
            if (danhSachPhanLoai.SanPham.Count == 0)
                return NotFound();
            else
                return View(danhSachPhanLoai);
        }

        private PhanTrangSanPham LayDanhSachSanPhamTheoPhanLoai(string tenLoai, int trangHienTai)
        {
            int maxRows = 20;

            var sanPhamPhanLoai = _context.SanPham
            .Include(s => s.HangSanXuat)
            .Include(s => s.LoaiSanPham)
            .Where(r => r.LoaiSanPham.TenLoaiKhongDau == tenLoai);

            PhanTrangSanPham phanTrang = new PhanTrangSanPham();
            phanTrang.SanPham = sanPhamPhanLoai.OrderBy(r => r.LoaiSanPhamID)
            .Skip((trangHienTai - 1) * maxRows)
            .Take(maxRows).ToList();

            decimal tongSoTrang = Convert.ToDecimal(sanPhamPhanLoai.Count()) / Convert.ToDecimal(maxRows);
            phanTrang.TongSoTrang = (int)Math.Ceiling(tongSoTrang);
            phanTrang.TrangHienTai = trangHienTai;

            return phanTrang;
        }
        private readonly BookShopDbContext _context;

        public SanPhamController(BookShopDbContext context)
        {
            _context = context;
        }

        // GET: Index
        public IActionResult Index(int? trang)
        {
            var danhSach = LayDanhSachSanPham(trang ?? 1);
            if (danhSach.SanPham.Count == 0)
                return NotFound();
            else
                return View(danhSach);
        }

        private PhanTrangSanPham LayDanhSachSanPham(int trangHienTai)
        {
            int maxRows = 20;

            PhanTrangSanPham phanTrang = new PhanTrangSanPham();
            phanTrang.SanPham = _context.SanPham
            .Include(s => s.HangSanXuat)
            .Include(s => s.LoaiSanPham)
            .OrderBy(r => r.LoaiSanPhamID)
            .Skip((trangHienTai - 1) * maxRows)
            .Take(maxRows).ToList();

            decimal tongSoTrang = Convert.ToDecimal(_context.SanPham.Count()) / Convert.ToDecimal(maxRows);
            phanTrang.TongSoTrang = (int)Math.Ceiling(tongSoTrang);
            phanTrang.TrangHienTai = trangHienTai;

            return phanTrang;
        }
    }
    public class SanPhamConTroller : Controller
    {
        private readonly BookShopDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;


        public SanPhamConTroller(BookShopDbContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            _hostEnvironment = hostEnvironment;

        }
        // GET: SanPham
        public async Task<IActionResult> Index()
        {
            var BookShopDbContext = _context.SanPham.Include(s => s.HangSanXuat).Include(s => s.LoaiSanPham);
            return View(await BookShopDbContext.ToListAsync());

            //return View();
        }

        // POST: SanPham/Index_LoadData
        [HttpPost]
        public IActionResult Index_LoadData()
        {
            try
            {
                var draw = Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();

                int pageSize = length != null ? int.Parse(length) : 0;
                int skip = start != null ? int.Parse(start) : 0;
                int totalRecords = 0;
                int filterRecords = 0;

                var sanPham = from r in _context.SanPham
                              select new
                              {
                                  ID = r.ID,
                                  HinhAnh = r.HinhAnh,
                                  TenLoai = r.LoaiSanPham.TenLoai,
                                  TenHangSanXuat = r.HangSanXuat.TenHangSanXuat,
                                  TenSanPham = r.TenSanPham,
                                  SoLuong = r.SoLuong,
                                  DonGia = r.DonGia
                              };

                totalRecords = sanPham.Count();

                // Sắp xếp
                if (!string.IsNullOrEmpty(sortColumn) && !string.IsNullOrEmpty(sortColumnDirection))
                {
                    sanPham = sanPham.OrderBy(sortColumn + " " + sortColumnDirection);
                }

                // Tìm kiếm
                if (!string.IsNullOrEmpty(searchValue) && !string.IsNullOrWhiteSpace(searchValue))
                {
                    sanPham = sanPham.Where(r => r.TenLoai.Contains(searchValue) ||
                    r.TenHangSanXuat.Contains(searchValue) ||
                   r.TenSanPham.Contains(searchValue) ||
                   r.SoLuong.ToString().Contains(searchValue) ||
                   r.DonGia.ToString().Contains(searchValue));
                }

                filterRecords = sanPham.Count();
                var data = sanPham.Skip(skip).Take(pageSize).ToList();
                var jsonData = new
                {
                    draw = draw,
                    recordsFiltered = filterRecords,
                    recordsTotal = totalRecords,
                    data = data
                };

                return Json(jsonData, new System.Text.Json.JsonSerializerOptions());
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}