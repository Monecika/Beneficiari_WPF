using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Models;

[Table("ConturiBancare")]
public partial class ConturiBancare
{
    [Key]
    [Column("ContID")]
    public int ContId { get; set; }

    [Column("BeneficiarID")]
    public int? BeneficiarId { get; set; }

    [StringLength(50)]
    [Unicode(false)]
    public string NumarCont { get; set; } = null!;

    [StringLength(50)]
    [Unicode(false)]
    public string NumarBanca { get; set; } = null!;

    [ForeignKey("BeneficiarId")]
    [InverseProperty("ConturiBancares")]
    public virtual Beneficiari? Beneficiar { get; set; }
}
