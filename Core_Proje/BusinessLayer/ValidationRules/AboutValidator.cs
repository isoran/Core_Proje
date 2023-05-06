using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ValidationRules
{
    public class AboutValidator:AbstractValidator<About>
    {
        public AboutValidator()
        {
            RuleFor(x => x.Title).NotEmpty().WithMessage("Başlık boş olamaz");
            RuleFor(x => x.Title).MinimumLength(8).WithMessage("Başlık 8 karakterden az olamaz");
            RuleFor(x => x.Title).MaximumLength(25).WithMessage("Başlık 25 karakterden fazla olamaz");

            RuleFor(x => x.Description).NotEmpty().WithMessage("Açıklama boş olamaz");
            RuleFor(x => x.Description).MinimumLength(10).WithMessage("Açıklama 10 karakterden az olamaz");
            RuleFor(x => x.Description).MaximumLength(150).WithMessage("Açıklama 150 karakterden fazla olamaz");

            RuleFor(x => x.Age).NotEmpty().WithMessage("Yaş boş olamaz");
            
            RuleFor(x => x.Mail).NotEmpty().WithMessage("Mail boş olamaz");
            RuleFor(x => x.Mail).MinimumLength(7).WithMessage("Mail 7 karakterden az olamaz");
            RuleFor(x => x.Mail).MaximumLength(50).WithMessage("Mail 50 karakterden fazla olamaz");

            RuleFor(x => x.Phone).NotEmpty().WithMessage("Telefon boş olamaz");
            RuleFor(x => x.Phone).MinimumLength(8).WithMessage("Telefon 8 karakterden az olamaz");
            RuleFor(x => x.Phone).MaximumLength(20).WithMessage("Telefon 20 karakterden fazla olamaz");

            RuleFor(x => x.Address).NotEmpty().WithMessage("Adres boş olamaz");
            RuleFor(x => x.Address).MinimumLength(8).WithMessage("Adres 8 karakterden az olamaz");
            RuleFor(x => x.Address).MaximumLength(100).WithMessage("Adres 100 karakterden fazla olamaz");

            RuleFor(x => x.ImageUrl).NotEmpty().WithMessage("Resim boş olamaz");
            RuleFor(x => x.ImageUrl).MinimumLength(5).WithMessage("Resim 5 karakterden az olamaz");
            RuleFor(x => x.ImageUrl).MaximumLength(150).WithMessage("Resim 150 karakterden fazla olamaz");


        }
    }
}
