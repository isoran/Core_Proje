using BusinessLayer.Abstract;
using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Concrete
{
    public class TestimonialManager : ITestimonialService
    {
        ITestimonialDal _testmonialDal;

        public TestimonialManager(ITestimonialDal testmonialDal)
        {
            _testmonialDal = testmonialDal;
        }

        public void TAdd(Testimonial t)
        {
            _testmonialDal.Insert(t);
        }

        public void TDelete(Testimonial t)
        {
            _testmonialDal.Delete(t);
        }

        public Testimonial TGetByID(int id)
        {
            return _testmonialDal.GetByID(id);
        }

        public List<Testimonial> TGetList()
        {
            return _testmonialDal.GetList();
        }

        public List<Testimonial> TGetListByFilter()
        {
            throw new NotImplementedException();
        }

        public void TUpdate(Testimonial t)
        {
            _testmonialDal.Update(t);
        }
    }
}
