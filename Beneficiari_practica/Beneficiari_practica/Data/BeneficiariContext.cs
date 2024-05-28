using System;
using System.Collections.Generic;
using Beneficiari_practica.Models;
using Microsoft.EntityFrameworkCore;

namespace Beneficiari_practica.Data;

public partial class BeneficiariContext : DbContext
{
    public BeneficiariContext()
    {
    }

    public BeneficiariContext(DbContextOptions<BeneficiariContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Beneficiari> Beneficiaris { get; set; }

    public virtual DbSet<ConturiBancare> ConturiBancares { get; set; }

    public virtual DbSet<DocumenteIdentitate> DocumenteIdentitates { get; set; }

    public virtual DbSet<IstoricTranzactii> IstoricTranzactiis { get; set; }

    public virtual DbSet<LoginUser> LoginUsers { get; set; }
    public virtual DbSet<BeneficiariCopy> BeneficiarisCopy { get; set; }

    public virtual DbSet<Plati> Platis { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Data Source=MONAA;Initial Catalog=Beneficiari;Integrated Security=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Beneficiari>(entity =>
        {
            entity.HasKey(e => e.BenificiarId).HasName("PK__Benefici__0BCA4D94B7CF9881");

            entity.ToTable("Beneficiari", tb => tb.HasTrigger("addInsertedWithID"));

            entity.Property(e => e.BenificiarId).ValueGeneratedNever();
        });

        modelBuilder.Entity<ConturiBancare>(entity =>
        {
            entity.HasKey(e => e.ContId).HasName("PK__ConturiB__F03BCFB93A8CBD9D");

            entity.Property(e => e.ContId).ValueGeneratedNever();

            entity.HasOne(d => d.Beneficiar).WithMany(p => p.ConturiBancares).HasConstraintName("FK__ConturiBa__Benef__3C69FB99");
        });

        modelBuilder.Entity<DocumenteIdentitate>(entity =>
        {
            entity.HasKey(e => e.DocumentId).HasName("PK__Document__1ABEEF6F5C3392A4");

            entity.Property(e => e.DocumentId).ValueGeneratedNever();

            entity.HasOne(d => d.Beneficiar).WithMany(p => p.DocumenteIdentitates).HasConstraintName("FK__Documente__Benef__4222D4EF");
        });

        modelBuilder.Entity<IstoricTranzactii>(entity =>
        {
            entity.HasKey(e => e.TranzactieId).HasName("PK__IstoricT__752856B8D519C357");

            entity.Property(e => e.TranzactieId).ValueGeneratedNever();

            entity.HasOne(d => d.Beneficiar).WithMany(p => p.IstoricTranzactiis).HasConstraintName("FK__IstoricTr__Benef__3F466844");
        });

        modelBuilder.Entity<LoginUser>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__login_Us__1788CCACCE556903");

            entity.Property(e => e.UserId).ValueGeneratedNever();
        });

        modelBuilder.Entity<Plati>(entity =>
        {
            entity.HasKey(e => e.PlatiId).HasName("PK__Plati__492CDD3B4F804D77");

            entity.Property(e => e.PlatiId).ValueGeneratedNever();

            entity.HasOne(d => d.Benificiar).WithMany(p => p.Platis).HasConstraintName("FK__Plati__Benificia__398D8EEE");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
