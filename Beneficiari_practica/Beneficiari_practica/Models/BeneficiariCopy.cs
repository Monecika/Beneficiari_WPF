using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Beneficiari_practica.Models
{
    [Table("BeneficiariCopy")]
    public partial class BeneficiariCopy
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("BenificiarID")]
        public int BenificiarId { get; set; }

        [StringLength(30)]
        [Unicode(false)]
        public string? Nume { get; set; }

        [StringLength(30)]
        [Unicode(false)]
        public string? Prenume { get; set; }

        [StringLength(100)]
        [Unicode(false)]
        public string? Adresa { get; set; }

        [StringLength(20)]
        [Unicode(false)]
        public string? Telefon { get; set; }

        [StringLength(10)]
        [Unicode(false)]
        public string? Mediul { get; set; }

        [StringLength(10)]
        [Unicode(false)]
        public string? CodLocalitate { get; set; }

        [StringLength(50)]
        [Unicode(false)]
        public string? Email { get; set; }
    }
}
