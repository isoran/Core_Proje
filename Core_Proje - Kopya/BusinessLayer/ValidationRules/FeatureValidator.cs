using EntityLayer.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ValidationRules
{
     public class FeatureValidator : AbstractValidator<Feature>
    {
        public FeatureValidator()
        {
            RuleFor(x => x.Header).NotEmpty().WithMessage("Başlık boş olamaz");
            RuleFor(x => x.Header).MinimumLength(8).WithMessage("Başlık 8 karakterden az olamaz");
            RuleFor(x => x.Header).MaximumLength(16).WithMessage("Başlık 16 karakterden fazla olamaz");

            RuleFor(x => x.Name).NotEmpty().WithMessage("İsim boş olamaz");
            RuleFor(x => x.Name).MinimumLength(3).WithMessage("İsim 3 karakterden az olamaz");
            RuleFor(x => x.Name).MaximumLength(25).WithMessage("İsim 25 karakterden fazla olamaz");

            RuleFor(x => x.Title).NotEmpty().WithMessage("Ünvan boş olamaz");
            RuleFor(x => x.Title).MinimumLength(5).WithMessage("Ünvan 5 karakterden az olamaz");
            RuleFor(x => x.Title).MaximumLength(150).WithMessage("Ünvan 150 karakterden fazla olamaz");
        }
    }
}
