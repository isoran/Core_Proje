using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ValidationRules
{
    public class PortfolioValidator:AbstractValidator<Portfolio>
    {
        public PortfolioValidator()
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Proje Adı boş olamaz");
            RuleFor(x => x.ImageUrl).NotEmpty().WithMessage("Görsel-1 boş olamaz");
            RuleFor(x => x.ImageUrl2).NotEmpty().WithMessage("Görsel-2 boş olamaz");
            RuleFor(x => x.Price).NotEmpty().WithMessage("Fiyat boş olamaz");
            RuleFor(x => x.Value).NotEmpty().WithMessage("Değer boş olamaz");
            RuleFor(x => x.Name).MinimumLength(5).WithMessage("Proje Adı en az 5 karakter olmalıdır.");
            RuleFor(x => x.Name).MaximumLength(50).WithMessage("Proje Adı en çok 50 karakter olmalıdır.");

        }
    }
}
