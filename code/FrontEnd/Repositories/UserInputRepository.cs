using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;

namespace FrontEnd.Repositories
{

    [ExcludeFromCodeCoverage]
    public class UserInputRepository:Repository<UserInput>, IUserInputRepository
    {
        public UserInputRepository(ApplicationDbContext dbContext) : base(dbContext)
        {

        }
    }
}

