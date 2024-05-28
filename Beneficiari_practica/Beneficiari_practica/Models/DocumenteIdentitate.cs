using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Models;

[Table("DocumenteIdentitate")]
public partial class DocumenteIdentitate
{
    [Key]
    [Column("DocumentID")]
    public int DocumentId { get; set; }

    [Column("BeneficiarID")]
    public int? BeneficiarId { get; set; }

    [StringLength(20)]
    [Unicode(false)]
    public string TipDocument { get; set; } = null!;

    [StringLength(50)]
    [Unicode(false)]
    public string NumarDocument { get; set; } = null!;

    public DateOnly DataExpirare { get; set; }

    [ForeignKey("BeneficiarId")]
    [InverseProperty("DocumenteIdentitates")]
    public virtual Beneficiari? Beneficiar { get; set; }
}
