﻿using Microsoft.EntityFrameworkCore;
using ProjectTest.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace ProjectTest.Repositories
{
    public class GenericRepository<T> where T : class,new()
    {
        Context c = new Context();

        public List<T> TList()
        {
            return c.Set<T>().ToList();
        }
        public void TAdd(T p)
        {
            c.Set<T>().Add(p);
            c.SaveChanges();
        }
        public void TRemove(T p)
        {
            c.Set<T>().Remove(p);
            c.SaveChanges();
        }
        public void TEdit(T p)
        {
            c.Set<T>().Update(p);
            c.SaveChanges();
        }
        public T TGet(int id)
        {
            return c.Set<T>().Find(id);
        }
        public List<T> TList(string p)
        {
            return c.Set<T>().Include(p).ToList();
        }
        public List<T> List(Expression<Func<T,bool>>filter)
        {
            return c.Set<T>().Where(filter).ToList();
        }
    }
}