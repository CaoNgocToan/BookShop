using BookShop.Logic;
using BookShop.Models;
using Microsoft.AspNetCore.Mvc;
namespace BookShop.ViewComponents
{
	public class GioHangViewComponent : ViewComponent
	{
		private readonly BookShopDbContext _context;

		public GioHangViewComponent(BookShopDbContext context)
		{
			_context = context;
		}

		public async Task<IViewComponentResult> InvokeAsync()
		{
			GioHangLogic gioHangLogic = new GioHangLogic(_context);
			decimal tongTien = gioHangLogic.LayTongTienSanPham();
			decimal tongSoLuong = gioHangLogic.LayTongSoLuong();
			TempData["TopMenu_TongTien"] = tongTien;
			TempData["TopMenu_TongSoLuong"] = tongSoLuong;
			return View("Default");
		}
	}
}