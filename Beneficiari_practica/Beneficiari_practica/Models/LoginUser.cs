using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Models;

[Table("login_Users")]
public partial class LoginUser
{
    [Key]
    [Column("UserID")]
    public int UserId { get; set; }

    [StringLength(20)]
    [Unicode(false)]
    public string Username { get; set; } = null!;

    [StringLength(20)]
    [Unicode(false)]
    public string Pass { get; set; } = null!;
}
