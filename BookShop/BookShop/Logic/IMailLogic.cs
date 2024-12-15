using BookShop.Models;

namespace BookShop.Logic
{
	public interface IMailLogic
	{
		Task GoiEmail(MailInfo mailInfo);
		Task GoiEmailDatHangThanhCong(DatHang datHang, MailInfo mailInfo);
		Task GoiEmailDangKyThanhCong(NguoiDung nguoiDung, MailInfo mailInfo);

    }
}