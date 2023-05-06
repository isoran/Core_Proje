using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ValidationRules
{
    public class ServiceValidator:AbstractValidator<Service>
    {
        public ServiceValidator()
        {
            RuleFor(x => x.Title).NotEmpty().WithMessage("Başlık boş olamaz");
            RuleFor(x => x.Title).MinimumLength(8).WithMessage("Başlık 8 karakterden az olamaz");
            RuleFor(x => x.Title).MaximumLength(50).WithMessage("Başlık 50 karakterden fazla olamaz");

            RuleFor(x => x.ImageUrl).NotEmpty().WithMessage("ImageURL boş olamaz");
            RuleFor(x => x.ImageUrl).MinimumLength(8).WithMessage("ImageURL 8 karakterden az olamaz");
            RuleFor(x => x.ImageUrl).MaximumLength(50).WithMessage("ImageURL 50 karakterden fazla olamaz");
        }
    }
}
