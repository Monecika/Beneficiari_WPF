using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Models;

[Table("IstoricTranzactii")]
public partial class IstoricTranzactii
{
    [Key]
    [Column("TranzactieID")]
    public int TranzactieId { get; set; }

    [Column("BeneficiarID")]
    public int? BeneficiarId { get; set; }

    [StringLength(20)]
    [Unicode(false)]
    public string TipTranzactie { get; set; } = null!;

    public double Suma { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime DataTranzactie { get; set; }

    [ForeignKey("BeneficiarId")]
    [InverseProperty("IstoricTranzactiis")]
    public virtual Beneficiari? Beneficiar { get; set; }
}
