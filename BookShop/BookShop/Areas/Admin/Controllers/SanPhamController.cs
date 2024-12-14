using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SlugGenerator;
using BookShop.Models;
using Microsoft.AspNetCore.Authorization;
namespace BookShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class SanPhamController : Controller
    {
        private readonly BookShopDbContext _context;
        private readonly IWebHostEnvironment _hostEnvironment;


        public SanPhamController(BookShopDbContext context, IWebHostEnvironment hostEnvironment)
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