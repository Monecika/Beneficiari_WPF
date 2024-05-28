using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Beneficiari_practica.Models;

[Table("Beneficiari")]
public partial class Beneficiari
{

    [Key]
    [Column("BenificiarID")]
    public int BenificiarId { get; set; }

    [StringLength(30)]
    [Unicode(false)]
    public string Nume { get; set; } = null!;

    [StringLength(30)]
    [Unicode(false)]
    public string Prenume { get; set; } = null!;

    [StringLength(100)]
    [Unicode(false)]
    public string Adresa { get; set; } = null!;

    [StringLength(20)]
    [Unicode(false)]
    public string Telefon { get; set; } = null!;

    [StringLength(10)]
    [Unicode(false)]
    public string Mediul { get; set; } = null!;

    [StringLength(10)]
    [Unicode(false)]
    public string CodLocalitate { get; set; } = null!;

    [StringLength(50)]
    [Unicode(false)]
    public string Email { get; set; } = null!;

    [InverseProperty("Beneficiar")]
    public virtual ICollection<ConturiBancare> ConturiBancares { get; set; } = new List<ConturiBancare>();

    [InverseProperty("Beneficiar")]
    public virtual ICollection<DocumenteIdentitate> DocumenteIdentitates { get; set; } = new List<DocumenteIdentitate>();

    [InverseProperty("Beneficiar")]
    public virtual ICollection<IstoricTranzactii> IstoricTranzactiis { get; set; } = new List<IstoricTranzactii>();

    [InverseProperty("Benificiar")]
    public virtual ICollection<Plati> Platis { get; set; } = new List<Plati>();
}
