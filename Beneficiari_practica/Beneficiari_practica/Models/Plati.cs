using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Models;

[Table("Plati")]
public partial class Plati
{
    [Key]
    [Column("PlatiID")]
    public int PlatiId { get; set; }

    [Column("BenificiarID")]
    public int? BenificiarId { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string NumarCont { get; set; } = null!;

    [StringLength(50)]
    [Unicode(false)]
    public string NumeBanca { get; set; } = null!;

    [ForeignKey("BenificiarId")]
    [InverseProperty("Platis")]
    public virtual Beneficiari? Benificiar { get; set; }
}
